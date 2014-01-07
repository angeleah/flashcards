describe ApplicationHelper do
  describe ".local_display_date" do
    it "returns a formated local time and date" do
      Time.zone = 'Eastern Time (US & Canada)'        # => 'Eastern Time (US & Canada)'
      utc_datetime = Time.zone.local(2007, 2, 10, 15, 30, 45)
      expect(local_display_date(utc_datetime)).to eq("Sat Feb 10th, 3:30 PM")
    end
  end
end
