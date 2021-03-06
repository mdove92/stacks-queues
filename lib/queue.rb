class Queue
  def initialize
    @store = Array.new(100)
    @front = -1
    @back = -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    end
    if @front == @back
      raise ArgumentError, "QUEUE IS FULL. PLEASE STOP STUFFING IT."
    end
    @store[@back] = element
    @back = (@back + 1) % @store.length
    if @store[@front].nil?
      @front = (@front + 1) % @store.length
    end
  end

  def dequeue
    if (size == 0)
      return nil
    end
    temp_pop = @store[@front]
    @store[@front] = nil
    @front = (@front + 1) % @store.length
    return temp_pop
  end

  def front
    return @store[@front]
  end

  def size
    return @store.compact.size
  end

  def empty?
    return(size == 0)
  end

  def to_s
    return @store[@front...@back].to_s
  end
end
