require 'bundler'
Bundler.require

task :test do
  Dir.glob('./test/**/*_test.rb') { |file| require file }
end

task :play do
  ruby "./lib/runner.rb"
end