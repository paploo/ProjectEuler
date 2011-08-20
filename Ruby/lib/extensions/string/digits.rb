module Extensions
  module String
    module Digits

      def to_digits
        self.chars.map {|c| c.to_i}
      end

    end
  end
end