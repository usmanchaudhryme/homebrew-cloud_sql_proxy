class CloudSqlProxy < Formula
  desc "The Cloud SQL Proxy for GoogleCloudPlatform"
  homepage "https://github.com/GoogleCloudPlatform/cloudsql-proxy"
  version "1.20.2"
  url "https://github.com/GoogleCloudPlatform/cloud-sql-proxy/archive/refs/tags/v#{version}.tar.gz"
  sha256 "42219fbd8fcae1cd0e393b1395178f358faa5dcea4ebe8de57fa9cb0800ed0c7"
  head "https://github.com/GoogleCloudPlatform/cloud-sql-proxy.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"cloud_sql_proxy", "."
  end

  service do
    run [opt_bin/"cloud_sql_proxy", "-dir=/tmp/cloudsql"]
    keep_alive true
  end

  test do
    system "cloud_sql_proxy -version"
  end
end
