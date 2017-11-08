require "quicksort_median_of_three/version"

class Sort
  # Your code goes here...
  ONE_VAL = 1

  def self.quicksort(ar, lo, hi)

    if ((hi - lo) < 20)
      insertionSort(ar, lo, hi)
    else
      while (lo < hi)
        p = partition(ar, lo, hi)
        quicksort(ar, lo, p - 1)
        lo = (p + 1)
        #quicksort(ar, p + 1, hi)
      end
    end

    ar
  end

  def self.partition(ar, lo, hi)

    index = choose_pivot(ar, lo, hi)
    pivot = ar.fetch(index)
    ar[index], ar[hi] = ar[hi], ar[index]
    i = lo - 1
    (lo...hi).each do |j|
      if (ar.fetch(j) <= pivot)
        i = i + 1
        ar[i],ar[j] = ar[j],ar[i]
      end
    end
    i = (i + 1)
    ar[i], ar[hi] = ar[hi], ar[i]

    i
  end

  def self.choose_pivot(ar, lo, hi)

    left = lo
    right = hi
    center = (left + right) / 2
    if ((ar.fetch(left) - ar.fetch(right)) * (ar.fetch(center) - ar.fetch(left)) >= 0)
      left
    elsif ((ar.fetch(right) - ar.fetch(left)) * (ar.fetch(center) - ar.fetch(right)) >= 0)
      right
    else
      center
    end
  end

  def  self.insertionSort(ar, lo, hi)

    (lo + 1..hi).each do |i|
      value = ar.fetch(i)
      j = i - 1
      while (j >= 0 && ar.fetch(j) > value)
        ar[j+1] = ar.fetch(j)
        j -= 1
      end
      ar[j+1] = value
    end

    ar
  end

end