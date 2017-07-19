require 'irb'
require 'minitest/spec'
require 'minitest/autorun'
require 'rcli'

describe RCLI::ProfileFormatter do
  before do
    @default_profile_hash = {"id"=>2060, "first_name"=>"SengMing", "last_name"=>"Tan", "name"=>"SengMing Tan", "name_hl"=>"<b>SengMing</b> Tan", "email"=>"tansengming@example.com", "github"=>"tansengming", "twitter"=>"sengming", "image_path"=>"https://example.com/sengming_tan_150-7fbe9d18b566fe042ebd576d031d01faeed9868a9e977ace6583db9d1ed19e66.jpg", "phone_number"=>"555-555-5555", "slug"=>"2060-sengming-tan", "results_count"=>1, "bio_rendered"=>"", "before_rc_rendered"=>"<p>I&#39;ve done Rails development with Reading Eggs and Evercondo. In careers past I&#39;ve worked on the semantic web with Knorex and designed chips with Intel.</p>\n", "before_rc_match"=>false, "before_rc_hl"=>"I've done Rails development with Reading Eggs and Evercondo. In careers past I've", "before_rc_truncated"=>"I've done Rails development with Reading Eggs and...", "during_rc_rendered"=>"<p>I&#39;m trying to get into iOS development and Elixir. If I have time to stretch it&#39;ll be good to get into React, Docker, chat bots and writing as well.</p>\n", "during_rc_match"=>false, "during_rc_hl"=>"I'm trying to get into iOS development and Elixir. If I have time to", "during_rc_truncated"=>"I'm trying to get into iOS development and Elixir. If I...", "interests_rendered"=>"<p>Ruby, Comic Books, Crime Fiction, Shura</p>\n", "interests_match"=>false, "interests_hl"=>"Ruby, Comic Books, Crime Fiction, Shura", "interests_truncated"=>"Ruby, Comic Books, Crime Fiction, Shura", "employer_info_rendered"=>"", "current_location"=>{"id"=>21652, "name"=>"Jersey City, NJ", "short_name"=>nil}, "stints"=>[{"id"=>1019, "type"=>"retreat", "title"=>nil, "for_half_batch"=>true, "in_progress"=>false, "start_date"=>"2016-11-07", "end_date"=>"2016-12-15", "batch"=>{"id"=>31, "name"=>"Winter 1, 2016", "short_name"=>"W1'16", "alt_name"=>"Winter 1 '16"}}]}
    @profile_hash         = @default_profile_hash
  end
  subject { RCLI::ProfileFormatter.(@profile_hash) }

  it 'be formatted just right' do
    -> {puts subject}.must_output <<~RESULTEND
      Name: SengMing Tan
      Email: tansengming@example.com
      Github: tansengming
      Twitter: sengming
      Image: https://example.com/sengming_tan_150-7fbe9d18b566fe042ebd576d031d01faeed9868a9e977ace6583db9d1ed19e66.jpg
      Phone Number: 555-555-5555
      Before RC: I've done Rails development with Reading Eggs and...
      During RC: I'm trying to get into iOS development and Elixir. If I...
      Interests: Ruby, Comic Books, Crime Fiction, Shura
    RESULTEND
  end
end