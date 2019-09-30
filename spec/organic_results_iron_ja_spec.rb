describe "Google Scholar Organic Results API", type: :request do

  describe "Organic results for Iron in Japanese" do

    before :all do
      get search_path(engine: "google_scholar", q: "鉄", hl: "ja")
      @json = response.parsed_body
    end

    it "should return http success" do
      @response.code.should eq "200"
    end

    it "should contain organic results array" do
      @json["organic_results"].should be_an(Array)
    end

    describe "have correct organic results" do

      before :all do
        @result = @json["organic_results"][0]
      end

      it "should have title" do
        @result["title"].should_not be_empty
      end

      it "should have link" do
        @result["link"].should_not be_empty
      end

      it "should have snippet" do
        @result["snippet"].should_not be_empty
      end

      it "should have publication info summary" do
        @result["publication_info"]["summary"].should_not be_empty
      end
  
      it "should have inline links" do
        @result["inline_links"].should be_a(Hash)
        @result["inline_links"]["cited_by"].should be_a(Hash)
        @result["inline_links"]["cited_by"]["total"].should be_an(Integer)
        @result["inline_links"]["cited_by"]["serpapi_scholar_link"].should include("https://serpapi.com")
        @result["inline_links"]["related_pages_link"].should_not be_empty
        @result["inline_links"]["versions"].should be_a(Hash)
        @result["inline_links"]["versions"]["total"].should be_an(Integer)
        @result["inline_links"]["versions"]["serpapi_scholar_link"].should include("https://serpapi.com")
      end

    end
  
  end

end