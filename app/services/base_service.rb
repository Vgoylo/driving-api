class BaseService
  def self.call(*args, **key_args, &block)
    new(*args, **key_args, &block).call
  end
end
