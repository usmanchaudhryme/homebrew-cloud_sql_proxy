class CloudSqlProxy < Formula
  desc 'The Cloud SQL Proxy for GoogleCloudPlatform'
  homepage 'https://github.com/GoogleCloudPlatform/cloudsql-proxy'
  version '1.20.2'
  url "https://github.com/GoogleCloudPlatform/cloud-sql-proxy/archive/refs/tags/v#{version}.tar.gz"
  head 'https://github.com/GoogleCloudPlatform/cloud-sql-proxy.git'

  depends_on 'go' => :build

  def install
    system 'go', 'build', '-o', bin / 'cloud_sql_proxy', '.'
  end

  service do
    run [opt_bin / 'cloud_sql_proxy', '-dir=/tmp/cloudsql']
    keep_alive true
  end

  test do
    system 'cloud_sql_proxy -version'
  end
end
