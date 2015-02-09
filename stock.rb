class Stock
  def initialize
    @attributes = {}
  end

  def method_missing(method, *args)
    attribute = method.to_s
    if attribute =~ /=$/
      @attributes[attribute.chop] = args[0]
    else
      @attributes[attribute]
    end
  end
end

module StockHelper
  def stock
    @stock ||= Stock.new
  end

  def empty_stock
    @stock = nil
  end

  alias_method :clear_stock, :empty_stock
end

World(StockHelper)

After do
  clear_stock
end