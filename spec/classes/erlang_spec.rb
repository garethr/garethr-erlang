require 'spec_helper'

describe 'erlang', :type => :class do

  context 'on Debian' do
    let(:facts) { {:osfamily => 'Debian', :lsbdistcodename => 'squeeze'} }

    context 'with no parameters' do
      it { should contain_package('erlang-nox').with_ensure('present') }
      it { should contain_apt__source('erlang').with(
        'key_source' => 'http://binaries.erlang-solutions.com/debian/erlang_solutions.asc',
        'key'        => 'D208507CA14F4FCA'
      ) }
    end

    context 'with a custom version' do
      let(:params) { {'version' => 'absent' } }
      it { should contain_package('erlang-nox').with_ensure('absent') }
    end
  end

  context 'on RedHat 5' do
    let(:facts) { {:osfamily => 'RedHat', :operatingsystemrelease => '5.9' } }

    context 'with no parameters' do
      it { should contain_package('erlang').with_ensure('present') }
      it { should contain_exec('erlang-repo-download').with(
        'command' => 'curl -o /etc/yum.repos.d/epel-erlang.repo http://repos.fedorapeople.org/repos/peter/erlang/epel-erlang.repo',
        'path'    => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin'
        )
      }
    end

    context 'with a custom version' do
      let(:params) { {'version' => 'absent' } }
      it { should contain_package('erlang').with_ensure('absent') }
    end
  end

  context 'on RedHat 6' do
    let(:facts) { {:osfamily => 'RedHat', :operatingsystemrelease => '6.4' } }

    context 'with no parameters' do
      it { should contain_package('erlang').with_ensure('present') }
    end

    context 'with a custom version' do
      let(:params) { {'version' => 'absent' } }
      it { should contain_package('erlang').with_ensure('absent') }
    end
  end

  context 'on SUSE' do
    let(:facts) {{ :osfamily => 'SUSE', }}

    context 'with no parameters' do
      it { should contain_package('erlang').with_ensure('present') }
    end

    context 'with a custom version' do
      let(:params) { {'version' => 'absent' } }
      it { should contain_package('erlang').with_ensure('absent') }
    end
  end

end
