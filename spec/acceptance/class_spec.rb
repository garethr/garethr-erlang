require 'spec_helper_acceptance'

describe 'erlang class:' do
  case fact('osfamily')
  when 'RedHat'
    package_name = 'rabbitmq-server'
  when 'Debian'
    package_name = 'rabbitmq-server'
  end

  context "default class inclusion" do
    it 'should run successfully' do
      pp = <<-EOS
      include 'erlang'
      EOS

      # Apply twice to ensure no errors the second time.
      apply_manifest(pp, :catch_failures => true)
      expect(apply_manifest(pp, :catch_changes => true).exit_code).to be_zero
    end

    describe package(package_name) do
      it { should be_installed }
    end

  end

end
