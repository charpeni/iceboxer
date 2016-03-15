require 'octokit'
require 'active_support/all'

module Iceboxer

  @@operations = [
    Iceboxer::Icebox,
    Iceboxer::Deprecate
  ]

  def self.run
    unless ENV['ICEBOXER_GITHUB_API_TOKEN'].present?
      raise "Set ICEBOXER_GITHUB_API_TOKEN env variable with a token with repo access"
    end

    unless ENV['ICEBOXER_REPOS'].present?
      raise "Set ICEBOXER_REPOS env variable to repo(s) like 'org/repo1, org/repo2'"
    end

    Octokit.access_token = ENV['ICEBOXER_GITHUB_API_TOKEN']
    repositories = ENV["ICEBOXER_REPOS"].split(',').map(&:strip)

    @@operations.each do |op|
      repositories.each do |repository|
        op.new(repository).perform
      end
    end
  end
end
