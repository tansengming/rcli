module RCLI
  class Config
    PATH = Pathname.new("#{ENV['HOME']}/.rclirc")

    def self.get(key)
      return unless PATH.exist?

      PATH.each_line do |line|
        return $1 if line[/#{key.to_s}:(\w+)/]
      end
    end
  end
end