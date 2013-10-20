require "spec_helper"

describe InternalQuoteCleaner do

  context "with a double quoted word inside column" do
    subject do
      described_class.new(%Q(","adsf "hello" asdfasfd","))
    end
    it "should have the right matching content" do
      expect(subject.matching_attribute_content).to eq %Q(adsf "hello" asdfasfd)
    end
  end

  context "with quotes immediately following the initial quotes" do
    let(:string) do
      <<-eos
"108870","American Film Institute Conservatory","2012",,,,"American Film Institute Conservatory","2021 N Western Ave","Los Angeles","90027-1625","3238567600","3238567720    ",,,,"www.afi.com/conservatory/admissions/fa_cost.aspx","Four or more years","Master's degree","No undergraduate offering","Master's degree","-118.309989","34.108460","Institution is open to the public","Active - institution active","Implied no","Yes","Not applicable","Implied no","Implied no","Implied no","Implied no","Implied no","Not applicable","Not applicable","Not applicable","Not applicable","Not applicable","Not applicable","Not applicable","Not applicable","Not applicable",,"A",,"A",,"A",,"A",,,,,,,,"A",,"A",,"A",,"A",,"A",,"A",,"A",,"A",,"A",,"A",,"A",,"A",,"A",,"A","Implied no","Yes","Implied no","Implied no","No","Implied no","Yes","Implied no","Implied no","Four","Yes","Yes","Has own library","Semester","Yes","Implied no","Implied no","Yes","Implied no",,"A","No","Not applicable","No","No",,"A",,"A",,,,,,,,,,,,,,,,,,,"A",,"A","39760","R",,"A",,"A",,,,"A",,"A","Implied no","Implied no","Implied no","Implied no","Implied no","Implied no","No","Not applicable","No","Not applicable",""AFI is America’s promise to preserve the history of the motion picture, to honor the artists and their work, and to educate the next generation of storytellers.  AFI provides leadership in film, television and digital media and is dedicated to initiatives that engage the past, the present and the future of the moving image arts."",,"358","R","0","R","121","R","82","R","39","R","0","R","0","R","0","R","11","R","7","R","4","R","7","R","6","R","1","R","5","R","5","R","0","R","0","R","0","R","0","R","57","R","36","R","21","R","6","R","5","R","1","R","0","R","0","R","0","R","35","R","23","R","12","R",,,"Under 1,000","California","Degree-granting, graduate with no undergraduate degrees","0","0",,,,,,
      eos
    end
    subject { described_class.new(string) }
    it "should have the right matching content" do
      expect(subject.matching_attribute_content).to eq %Q("AFI is America’s promise to preserve the history of the motion picture, to honor the artists and their work, and to educate the next generation of storytellers.  AFI provides leadership in film, television and digital media and is dedicated to initiatives that engage the past, the present and the future of the moving image arts.")
    end
  end

  context "with the row" do
    let(:row) do
      <<-eos
"452692","David-Curtis School of Floral Design","2012",,,,"David-Curtis School of Floral Design","209 N Main St.","Centerville","45459","9374330566","9374332975    ","www.david-curtis-school.com","www.david-curtis-school.com","www.david-curtis-school.com","www.david-curtis-school.com","Less than 2 years (below associate)","Award of less than one academic year","Undergraduate degree or certificate offering","Non-degree granting","-84.159121","39.630542","Institution is open to the public","Active - institution active","Yes","Implied no","Not applicable","Yes","Implied no","Implied no","Implied no","Not applicable","Yes","Not applicable","Not applicable","Not applicable","Not applicable","Not applicable","Not applicable","Not applicable","Not applicable",,"A",,"A",,"A",,"A",,,,,,,,"A",,"A",,"A",,"A",,"A",,"A",,"A",,"A",,"A",,"A",,"A",,"A",,"A",,"A","Implied no","Implied no","Implied no","Yes","No","Implied no","Yes","Implied no","Implied no","Not applicable","Implied no","Implied no","None of the above","Continuous","No","Implied no","Implied no","Implied no","Implied no","75","R","Not applicable","No","No","No",,"A",,"A","1","2450","R","0","R",,"A",,"A","650","R","175","R","165","R",,"A",,,,,,,,,,,,,,,,,"Not applicable","Not applicable","Not applicable","Not applicable","Not applicable","Not applicable","Not applicable","Not applicable","Not applicable","Not applicable","To provide students with the best training and education in floral design and flower shop operations. We accomplish this through the hands on "teaching style", lecture, labs, and various demonstrations, unlike other schools that teach you by copying or have you in class over 8 hours a day. We structure your learning so you receive the maximum benefits from a floral education. We keep you up to date with the current floral industry trends & news.",,"2","R","2","R","6","R","0","Z","6","R","0","Z","0","Z","0","Z","0","Z","0","Z","0","Z","2","R","0","Z","2","R","1","R","0","Z","1","R","0","Z","0","Z","0","Z","3","R","0","Z","3","R","0","Z","0","Z","0","Z","0","Z","0","Z","0","Z","0","Z","0","Z","0","Z",,,"Under 1,000","Ohio","Nondegree-granting, sub-baccalaureate","0",,,,,,,
      eos
    end
    subject { described_class.new(row) }
    it "should have the right matching content" do
      expect(subject.matching_attribute_content).to eq %Q(To provide students with the best training and education in floral design and flower shop operations. We accomplish this through the hands on "teaching style", lecture, labs, and various demonstrations, unlike other schools that teach you by copying or have you in class over 8 hours a day. We structure your learning so you receive the maximum benefits from a floral education. We keep you up to date with the current floral industry trends & news.)
    end
    it "should not match the clean string" do
      puts subject.clean
      expect(described_class.new(subject.clean)).to_not be_match
    end
  end  

end