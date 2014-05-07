module SabisuRails
  class RouteRecognizer
    attr_reader :paths

    # Based on @bantic solution - https://gist.github.com/bantic/5688232#file-rails_route_recognizer-rb
    # To use this inside your app, call:
    # `RouteRecognizer.new.initial_path_segments`
    # This returns an array, e.g.: ['assets','blog','team','faq','users']

    INITIAL_SEGMENT_REGEX = %r{^\/([^\/\(:]+)}
    IGNORED_PATHS = ["assets", "rails", "sabisu_rails"]

    def initialize
      routes = Rails.application.routes.routes
      @paths = routes.collect {|r| r.path.spec.to_s }
    end

    def initial_path_segments
      @initial_path_segments ||= begin
                                   paths.collect {|path| match_initial_path_segment(path)}.compact.uniq
                                 end
    end

    def match_initial_path_segment(path)
      if match = INITIAL_SEGMENT_REGEX.match(path)
        match[1] 
      end
    end

    def resources
      initial_path_segments - IGNORED_PATHS 
    end
  end
end
