require 'algorithms'

module EventHelper
  def self.next_n_events(events, date, num)
    result = []
    pq = Containers::PriorityQueue.new{ |x, y| (x <=> y) == -1 }
    events.each do |evt|
      next_event = evt.get_next_event(date)
      unless next_event.nil?
        pq.push(next_event, next_event.from_time)
      end
    end
    num.times do
      evt  = pq.pop
      if evt.nil?
        return result
      else
        result << evt
        next_event = evt.get_next_event(evt.from_time.to_date + 1)
        unless next_event.nil?
          pq.push(next_event, next_event.from_time)
        end
      end
    end
    result
  end

  def self.previous_n_events(events, date, num)

  end
end