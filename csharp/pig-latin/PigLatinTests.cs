using Xunit;

public class PigLatinTests
{
    [Fact]
    public void Word_beginning_with_a()
    {
        Assert.Equal("appleay", PigLatin.Translate("apple"));
    }

    [Fact]
    public void Word_beginning_with_e()
    {
        Assert.Equal("earay", PigLatin.Translate("ear"));
    }

    [Fact]
    public void Word_beginning_with_i()
    {
        Assert.Equal("iglooay", PigLatin.Translate("igloo"));
    }

    [Fact]
    public void Word_beginning_with_o()
    {
        Assert.Equal("objectay", PigLatin.Translate("object"));
    }

    [Fact]
    public void Word_beginning_with_u()
    {
        Assert.Equal("underay", PigLatin.Translate("under"));
    }

    [Fact]
    public void Word_beginning_with_a_vowel_and_followed_by_a_qu()
    {
        Assert.Equal("equalay", PigLatin.Translate("equal"));
    }

    [Fact]
    public void Word_beginning_with_p()
    {
        Assert.Equal("igpay", PigLatin.Translate("pig"));
    }

    [Fact]
    public void Word_beginning_with_k()
    {
        Assert.Equal("oalakay", PigLatin.Translate("koala"));
    }

    [Fact]
    public void Word_beginning_with_x()
    {
        Assert.Equal("enonxay", PigLatin.Translate("xenon"));
    }

    [Fact]
    public void Word_beginning_with_q_without_a_following_u()
    {
        Assert.Equal("atqay", PigLatin.Translate("qat"));
    }

    [Fact]
    public void Word_beginning_with_ch()
    {
        Assert.Equal("airchay", PigLatin.Translate("chair"));
    }

    [Fact]
    public void Word_beginning_with_qu()
    {
        Assert.Equal("eenquay", PigLatin.Translate("queen"));
    }

    [Fact]
    public void Word_beginning_with_qu_and_a_preceding_consonant()
    {
        Assert.Equal("aresquay", PigLatin.Translate("square"));
    }

    [Fact]
    public void Word_beginning_with_th()
    {
        Assert.Equal("erapythay", PigLatin.Translate("therapy"));
    }

    [Fact]
    public void Word_beginning_with_thr()
    {
        Assert.Equal("ushthray", PigLatin.Translate("thrush"));
    }

    [Fact]
    public void Word_beginning_with_sch()
    {
        Assert.Equal("oolschay", PigLatin.Translate("school"));
    }

    [Fact]
    public void Word_beginning_with_yt()
    {
        Assert.Equal("yttriaay", PigLatin.Translate("yttria"));
    }

    [Fact]
    public void Word_beginning_with_xr()
    {
        Assert.Equal("xrayay", PigLatin.Translate("xray"));
    }

    [Fact]
    public void Y_is_treated_like_a_consonant_at_the_beginning_of_a_word()
    {
        Assert.Equal("ellowyay", PigLatin.Translate("yellow"));
    }

    [Fact]
    public void Y_is_treated_like_a_vowel_at_the_end_of_a_consonant_cluster()
    {
        Assert.Equal("ythmrhay", PigLatin.Translate("rhythm"));
    }

    [Fact]
    public void Y_as_second_letter_in_two_letter_word()
    {
        Assert.Equal("ymay", PigLatin.Translate("my"));
    }

    [Fact]
    public void A_whole_phrase()
    {
        // Assert.Equal("ickquay astfay unray", PigLatin.Translate("quick fast run"));
    }
}
