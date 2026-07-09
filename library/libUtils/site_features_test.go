package libUtils

import "testing"

func TestBuildSEOMeta(t *testing.T) {
	opt := SiteSEOOptions{
		SiteName:           "GFast",
		DefaultTitle:       "默认标题",
		DefaultKeywords:    "go,gfast",
		DefaultDescription: "默认描述",
		TitleSeparator:     " | ",
	}
	meta := BuildSEOMeta(opt, "文章详情", "", "")
	if meta.Title != "文章详情 | GFast" {
		t.Fatalf("unexpected title: %s", meta.Title)
	}
	if meta.Keywords != "go,gfast" {
		t.Fatalf("unexpected keywords: %s", meta.Keywords)
	}
	if meta.Description != "默认描述" {
		t.Fatalf("unexpected description: %s", meta.Description)
	}
}

func TestApplyReplacementRules(t *testing.T) {
	content := "gfast 是一个后台框架"
	rules := []ReplacementRule{
		{From: "后台", To: "管理"},
		{From: "框架", To: "系统"},
	}
	got := ApplyReplacementRules(content, rules)
	if got != "gfast 是一个管理系统" {
		t.Fatalf("unexpected replacement result: %s", got)
	}
}

func TestBuildAndParsePseudoStaticURL(t *testing.T) {
	opt := URLRewriteOptions{
		Prefix: "article",
		Suffix: ".html",
	}
	url := BuildCustomContentURL("hello-world", opt)
	if url != "/article/hello-world.html" {
		t.Fatalf("unexpected custom url: %s", url)
	}
	slug, ok := ParsePseudoStaticContentURL(url, opt)
	if !ok {
		t.Fatalf("expected parse success")
	}
	if slug != "hello-world" {
		t.Fatalf("unexpected slug: %s", slug)
	}
}

func TestParsePseudoStaticURLFail(t *testing.T) {
	opt := URLRewriteOptions{
		Prefix: "article",
		Suffix: ".html",
	}
	_, ok := ParsePseudoStaticContentURL("/news/hello-world", opt)
	if ok {
		t.Fatalf("expected parse failure")
	}
}
