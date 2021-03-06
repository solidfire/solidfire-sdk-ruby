class SdkOperationError < RuntimeError
end

class ParameterError < RuntimeError
end

class ApiServiceError < RuntimeError
  attr_accessor :method_name, :json_error
  def initialize(method_name, error)
    self.method_name = method_name
    self.json_error = error
    super("Method Name: " + method_name + "; API Error: " + error.to_s)
  end
end

class ApiConnectionError < RuntimeError
  attr_accessor :host_name, :port_number
  def initialize(host_name, port_number, error)
    self.host_name = host_name
    self.port_number = port_number
    super("Tried connecting to "+host_name.to_s+":"+port_number.to_s+". "+error.to_s)
  end
end