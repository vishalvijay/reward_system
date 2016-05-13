class ObjectBenchmark

  def initialize object
    @object = object
  end

  private

  def method_missing name, *args, &block
    start = Time.now
    result = @object.send name, *args, &block
    finish = Time.now
    Rails.logger.info "\n\n\nObjectBenchmark : #{@object.class.name}.#{name} took #{finish - start} time to complete\n\n\n"
    result
  end
end
