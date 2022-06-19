defmodule BirdCount do
  def today([]) do
    nil
  end

  def today(list) do
    hd list
  end

  def increment_day_count([]) do
    [1]
  end

  def increment_day_count(list) do
    List.update_at(list, 0, fn elem -> elem + 1 end)
  end

  def has_day_without_birds?([]) do
    false
  end

  def has_day_without_birds?(list) do
    [first | tail] = list

    if first == 0 do
      true
    else
      has_day_without_birds?(tail)
    end
  end

  def total([]) do
    0
  end

  def total(list) do
    [head | tail] = list

    head + total(tail)
  end

  def busy_days([]) do
    0
  end

  def busy_days(list) do
    [head | tail] = list

    if head >= 5 do
      1 + busy_days(tail)
    else
      busy_days(tail)
    end
  end
end
