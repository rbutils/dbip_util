# frozen_string_literal: true

RSpec.describe DbipUtil do
  it "has a Country database that returns correct data for a sample address" do
    data = DbipUtil::Country.get("8.8.8.8")
    data["continent"]["code"].should be == "NA"
    data["continent"]["names"]["en"].should be == "North America"
    data["country"]["iso_code"].should be == "US"
    data["country"]["names"]["en"].should be == "United States"
  end

  it "has a ASN database that returns correct data for a sample address" do
    data = DbipUtil::ASN.get("8.8.8.8")
    data["autonomous_system_number"].should be == 15_169
    data["autonomous_system_organization"].should be == "Google LLC"
  end

  it "has a City database that returns correct data for a sample address" do
    data = DbipUtil::City.get("8.8.8.8")
    data["continent"]["code"].should be == "NA"
    data["continent"]["names"]["en"].should be == "North America"
    data["country"]["iso_code"].should be == "US"
    data["country"]["names"]["en"].should be == "United States"
    data["subdivisions"].first["names"]["en"].should be == "California"
    data["city"]["names"]["en"].should be == "Mountain View"
  end
end
