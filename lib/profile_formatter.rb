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
    current_location # temporarily disabled
    stints # temporarily disabled
    company # temporarily disabled
  }

  def self.call(profile_hash)
    new(profile_hash).call
  end

  def initialize(profile_hash)
    @profile_hash = profile_hash
    # warn profile_hash # debug
  end

  def call
    non_empty_values_without_ignored_keys.map{|k, v| [format_title(k), v].join(': ')}.join("\n")
  end

  private
  def non_empty_values_without_ignored_keys
    @non_empty_values ||= profile_hash
      .reject{|_, v| v.nil? }
      .reject{|_, v| v.respond_to?(:empty?) && v.empty? }
      .reject{|k, _| IGNORED_KEYS.include? k }
  end

  def format_title(key)
    key
      .tr('_', ' ')
      .gsub(/\s+(truncated|hl|path)/, '')  # cleanup title
      .gsub(/ rc/i, ' RC')                 # ditto
      .gsub(/\w+/){|w| w.capitalize}       # title case
  end
end