require_relative 'integer/digits'

Integer.send(:include, Extensions::Integer::Digits)