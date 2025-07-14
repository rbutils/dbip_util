# frozen_string_literal: true

require "dbip_util/version"
require "maxmind/db"

# DbipUtil includes DB-IP Lite databases and a simple interface to them, based on `maxmind-db` gem.
module DbipUtil
  extend self

  def open(db, options = {})
    ensure_provisioned!

    options = { mode: MaxMind::DB::MODE_FILE }.merge(options)
    fn = db_path(db)
    MaxMind::DB.new(fn, options)
  end

  def const_missing(const)
    case const
    when :Country
      const_set(const, open(:country))
    when :City
      const_set(const, open(:city))
    when :ASN
      const_set(const, open(:asn))
    else
      super
    end
  end

  private

  def db_path(db)
    __dir__ + "/dbip_util/db/dbip-#{db}-lite.mmdb"
  end

  def ensure_provisioned!
    # Check for a sample database. If not present, provision it from Rubygems.
    system "#{__dir__}/../bin/dbiputil-provision" unless File.exist?(db_path(:country))
  rescue StandardError
    warn "Couldn't provision a database! Use a `dbip_util` gem from Rubygems, as it includes a database."
    raise
  end
end
