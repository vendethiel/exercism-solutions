module TwoBucket
  enum Bucket
    One
    Two
  end

  struct Result
    property moves, other_bucket, goal_bucket

    def initialize(@moves : UInt32, @other_bucket : UInt32, @goal_bucket : Bucket)
    end

    def swap_bucket
      @goal_bucket = if @goal_bucket == Bucket::One
                       Bucket::Two
                     else
                       Bucket::One
                     end
      self
    end
  end

  def self.measure(bucket_one : UInt32, bucket_two : UInt32, goal : UInt32, start_bucket : Bucket)
    if start_bucket == Bucket::Two
      return self.measure(bucket_two, bucket_one, goal, Bucket::One).swap_bucket
    end

    return Result.new(0, 0, Bucket::One) if goal == 0
    return Result.new(1, 0, Bucket::One) if goal == bucket_one
    return Result.new(2, bucket_one, Bucket::Two) if goal == bucket_two

    steps = 0_u32
    v1 = v2 = 0
    while v1 != 0 || v2 != bucket_two
      steps += 2
      if v1 == 0
        v1 = bucket_one
      else
        v2 = 0
      end

      if v1 + v2 <= bucket_two
        v2 += v1
        v1 = 0
        return Result.new(steps, 0_u32, Bucket::Two) if v2 == goal
      else
        v1 -= bucket_two - v2
        v2 = bucket_two
        return Result.new(steps, bucket_two, Bucket::One) if v1 == goal
      end
    end
    raise ArgumentError.new("Impossible")
  end
end
