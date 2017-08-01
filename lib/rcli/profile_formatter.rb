module RCLI
  class ProfileFormatter
    attr_reader :profile_hash

    IGNORED_KEYS = %w{
      id
      name_hl
      slug
      interests_truncated
      before_rc_hl
      first_name
      last_name
      results_count
      before_rc_match
      before_rc_rendered
      during_rc_match
      during_rc_rendered
      during_rc_hl
      interests_match
      interests_rendered
      employer_info_rendered
      bio_rendered
      bio_hl
      bio_match
      employer_info_rendered
      employer_info_hl
      employer_info_match
      current_location
      company
      stints
    }

    def self.call(profile_hash)
      new(profile_hash).call
    end

    def initialize(profile_hash)
      @profile_hash = profile_hash
      # warn profile_hash # debug
    end

    def call
      profile_hash['batches'] = profile_hash['stints'].map{|hash| hash['batch']}.flatten.compact.map{|hash| hash['name']}
      profile_hash
        .reject{|_, v| v.nil? }                             # ignore nil values
        .reject{|_, v| v.respond_to?(:empty?) && v.empty? } # ignore empty values
        .reject{|k, _| IGNORED_KEYS.include? k }            # ignore some keys
        .reject{|k, v| k == 'image_path' && v[/no_photo_/]} # ignore images with no photo
        .map{|k, v| [format_title(k), v].join(': ')}
        .join("\n")
    end

    private
    def format_title(key)
      key
        .tr('_', ' ')
        .gsub(/\w+/){|w| w.capitalize}        # title case
        .gsub(/ rc/i, ' RC')                  # cleanup title
        .gsub(/\s+(truncated|hl|path)/i, '')  # ditto
    end
  end
end