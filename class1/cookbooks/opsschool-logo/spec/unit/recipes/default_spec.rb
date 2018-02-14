require 'spec_helper'

describe 'opsschool-logo::default' do

  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe)
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'updates the apt cache periodicaly' do
  end

  it 'installs the nginx package' do
  end

  it 'creates the application directory' do
  end

  it 'creates the application html' do
  end

  it 'fetches the logo file' do
  end

  it 'disables the default site' do
  end

  it 'create the app site config' do
  end

  it 'enables the app site' do
  end

  it 'enables the nginx service' do
  end

  it 'starts the nginx service' do
  end
end
