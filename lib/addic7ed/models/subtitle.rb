module Addic7ed
  class Subtitle
    attr_reader :version, :language, :status, :source, :downloads, :comment
    attr_accessor :url

    def initialize(options = {})
      @version   = NormalizeVersion.call(options[:version])
      @language  = options[:language]
      @status    = options[:status]
      @url       = options[:url]
      @source    = options[:source]
      @hi        = options[:hi]
      @downloads = options[:downloads].to_i || 0
      @comment   = NormalizeComment.call(options[:comment])
    end

    def to_s
      str = "#{url}\t->\t#{version} (#{language}, #{status}) [#{downloads} downloads]"
      str += " (source #{source})" if source
      str
    end

    def completed?
      status == "Completed"
    end
  end
end
