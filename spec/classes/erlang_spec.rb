require 'spec_helper'

describe 'erlang', :type => :class do
  let(:facts) { {:osfamily => 'Debian', :lsbdistcodename => 'precise'} }

  context 'with no parameters' do
    it { should contain_package('esl-erlang').with_ensure('present') }
    it { should contain_apt__source('erlang') }
  end

  context 'with a custom version' do
    let(:params) { {'version' => 'absent' } }
    it { should contain_package('esl-erlang').with_ensure('absent') }
  end

  context 'with an invalid distro name' do
    let(:facts) { {:osfamily => 'RedHat'} }
    it do
      expect {
        should contain_package('esl-erlang')
      }.to raise_error(Puppet::Error, /This module uses a debian repository/)
    end
  end


end
