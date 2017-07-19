module RCLI
  class LocalToken
    PATH = Pathname.new("#{ENV['HOME']}/.rclirc")

    def self.call
      return unless PATH.exist?

      PATH.each_line do |line|
        return $1 if line[/token:(\w+)/]
      end
    end
  end
end