require 'diary_entry'

RSpec.describe DiaryEntry do
    it 'constructs' do
        entry_1 = DiaryEntry.new("First Entry", "I love summer")
        expect(entry_1.title).to eq "First Entry"
        expect(entry_1.contents).to eq "I love summer"
    end

    describe "#count_words" do 
        it "returns 0 if there are no words in contents" do
            entry_1 = DiaryEntry.new("First Entry", "")
            expect(entry_1.count_words).to eq 0
        end

        it "returns 1 if there is one word in contents" do
            entry_1 = DiaryEntry.new("First Entry", "word")
            expect(entry_1.count_words).to eq 1
        end

        it "counts how many words are in contents and returns an integer value" do
            entry_1 = DiaryEntry.new("First Entry", "I love summer")
            expect(entry_1.count_words).to eq 3
        end
    end

    describe "#reading_time" do 
        it "fails if the wpm is 0" do
            entry_1 = DiaryEntry.new("First Entry", "I love summer as everybody")
            expect { entry_1.reading_time(0) }.to raise_error "WPM must be positive"
        end

        it "returns 0 if there are no words in contents" do
            entry_1 = DiaryEntry.new("First Entry", "")
            expect(entry_1.reading_time(2)).to eq 0
        end

        it "returns 1 if there is one word in contents" do
            entry_1 = DiaryEntry.new("First Entry", "word")
            expect(entry_1.reading_time(2)).to eq 1
        end

        it "returns a reading time for the contents" do
            entry_1 = DiaryEntry.new("First Entry", "I love summer as everybody")
            expect(entry_1.reading_time(2)).to eq 3
        end
    end
end