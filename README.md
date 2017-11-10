# BridgeCache

https://www.getbridge.com/

Bridge Cache is a data dump engine used to cache remote bridge data into a local database.

The application mimics the bridge data model and will copy csv rows directly into the local
data store without any extra configuration

## Installation

### Rails

 Add the following to your gemfile

 ```ruby
 gem 'bridge_cache'
 ```

 Then run your migrations

 ```ruby
 rake db:migrate
 ```

 Enable Bridge data dumps through the administrative interface in bridge, or have your bridge
 admin enable it for you.

## Usage

  ```ruby
  BridgeCache::configure do |config|
    config.models = [
      'user',
      'group',
      'domain',
      'course_template'
    ],
    batch_size: 10_000
  end
  ```

  To import an entire csv

  ```ruby
  BridgeCache::User.import_from_csv(path_to_csv)
  ```

  Import a list of models from a data dump automatically.

  These jobs interface with ActiveJob
  so make sure you configure it in your project or these won't run.

  ```ruby
  account_settings = {
    url: 'https://yourbridgeurl.bridgeapp.com',
    api_key: 'yourapikey',
    api_secret: 'yourapisecret',
    is_subaccount: true 
  }

  chain = [
    {
      job: 'SomeClassName',
      params: [
        'something'
      ]
    },
    {
      job: 'SomeOtherClass',
      params: [
        'somethingelse'
      ]
    }
  ]

  BridgeCache::Jobs::ImportStart.perform_later(account_settings, chain)
  ```
