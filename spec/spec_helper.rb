$: << File.expand_path(File.dirname(__FILE__) + '/../')

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"
end

def create_ruby_cards
   Card.create!( terms_attributes: [{term: "-"}, {term: "array difference"}],
   definition: "Returns a new array that is a copy of the original array, removing any items that also appear in other_ary. The order is preserved from the original array.",
   object_type: "Array",
   example: '<pre class="ruby">[ <span class="ruby-value">1</span>, <span class="ruby-value">1</span>, <span class="ruby-value">2</span>, <span class="ruby-value">2</span>, <span class="ruby-value">3</span>, <span class="ruby-value">3</span>, <span class="ruby-value">4</span>, <span class="ruby-value">5</span> ] <span class="ruby-operator">-</span> [ <span class="ruby-value">1</span>, <span class="ruby-value">2</span>, <span class="ruby-value">4</span> ]  <span class="ruby-comment">#=&gt;  [ 3, 3, 5 ]</span>
  </pre>',
   return_type: "new Array",
   category: "Ruby")

  Card.create!(terms_attributes: [{term: "compact"}],
   definition: "Returns a copy of self with all nil elements removed.",
   object_type: "Array",
   example: '<pre class="ruby">[ <span class="ruby-string">"a"</span>, <span class="ruby-keyword">nil</span>, <span class="ruby-string">"b"</span>, <span class="ruby-keyword">nil</span>, <span class="ruby-string">"c"</span>, <span class="ruby-keyword">nil</span> ].<span class="ruby-identifier">compact</span>
                    <span class="ruby-comment">#=&gt; [ "a", "b", "c" ]</span>
  </pre>',
   return_type: "new Array",
   category: "Ruby")

  Card.create!(terms_attributes: [{term: "exist?"}],
   definition: "Return true if the named file exists.",
   object_type: "File",
   example: "nil",
   return_type: "Boolean",
   category: "Ruby")
end

def create_clojure_card
  Card.create!(terms_attributes: [{term: "find"}],
   definition: "Returns the map entry for key, or nil if key not present.",
   object_type: "Core",
   example: '<td class="content"><code class="plain">user=&gt; </code><code class="keyword">(</code><code class="functions">find</code> <code class="keyword">{</code><code class="constants">:b</code> <code class="value">2</code> <code class="constants">:a</code> <code class="value">1</code> <code class="constants">:c</code> <code class="value">3</code><code class="keyword">}</code> <code class="constants">:d</code><code class="keyword">)</code></td>',
   return_type: "map",
   category: "Clojure")
end
