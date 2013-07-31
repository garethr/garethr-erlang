require 'spec_helper_system'

describe 'basic tests' do
  it 'Puppet should work without errors' do
    pp = <<-EOS
      include 'erlang'
    EOS

    puppet_apply(pp) do |r|
      r.exit_code.should == 2
      r.refresh
      r.exit_code.should be_zero
    end
  end

  it 'Erlang should be available' do
    shell 'which erl' do |r|
      r.stdout.should =~ /\/usr\/bin\/erl/
      r.stderr.should be_empty
      r.exit_code.should be_zero
    end
  end
end
