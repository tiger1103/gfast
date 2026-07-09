package libUtils

import (
	"strings"
)

// SiteSEOMeta SEO 元信息
type SiteSEOMeta struct {
	Title       string
	Keywords    string
	Description string
}

// SiteSEOOptions 站点 SEO 配置
type SiteSEOOptions struct {
	SiteName           string
	DefaultTitle       string
	DefaultKeywords    string
	DefaultDescription string
	TitleSeparator     string
}

// ReplacementRule 字符替换规则
type ReplacementRule struct {
	From string
	To   string
}

// URLRewriteOptions URL 重写配置
type URLRewriteOptions struct {
	Prefix string
	Suffix string
}

// BuildSEOMeta 构建 SEO 元信息，优先级：页面值 > 站点默认值
func BuildSEOMeta(opt SiteSEOOptions, pageTitle, pageKeywords, pageDescription string) SiteSEOMeta {
	meta := SiteSEOMeta{
		Title:       strings.TrimSpace(pageTitle),
		Keywords:    strings.TrimSpace(pageKeywords),
		Description: strings.TrimSpace(pageDescription),
	}
	if meta.Title == "" {
		meta.Title = strings.TrimSpace(opt.DefaultTitle)
	}
	if meta.Keywords == "" {
		meta.Keywords = strings.TrimSpace(opt.DefaultKeywords)
	}
	if meta.Description == "" {
		meta.Description = strings.TrimSpace(opt.DefaultDescription)
	}
	siteName := strings.TrimSpace(opt.SiteName)
	if siteName != "" {
		if meta.Title == "" {
			meta.Title = siteName
		} else if !strings.Contains(meta.Title, siteName) {
			sep := opt.TitleSeparator
			if sep == "" {
				sep = " - "
			}
			meta.Title = meta.Title + sep + siteName
		}
	}
	return meta
}

// ApplyReplacementRules 按顺序应用字符替换规则
func ApplyReplacementRules(content string, rules []ReplacementRule) string {
	output := content
	for _, rule := range rules {
		from := rule.From
		if from == "" {
			continue
		}
		output = strings.ReplaceAll(output, from, rule.To)
	}
	return output
}

// BuildCustomContentURL 生成自定义内容 URL
func BuildCustomContentURL(slug string, opt URLRewriteOptions) string {
	slug = strings.TrimSpace(slug)
	if slug == "" {
		return "/"
	}
	slug = strings.Trim(slug, "/")
	prefix := strings.Trim(strings.TrimSpace(opt.Prefix), "/")
	suffix := strings.TrimSpace(opt.Suffix)
	if prefix != "" {
		return "/" + prefix + "/" + slug + suffix
	}
	return "/" + slug + suffix
}

// ParsePseudoStaticContentURL 解析伪静态 URL，返回 slug
func ParsePseudoStaticContentURL(urlPath string, opt URLRewriteOptions) (string, bool) {
	path := strings.TrimSpace(urlPath)
	if path == "" {
		return "", false
	}
	path = strings.Trim(path, "/")
	if path == "" {
		return "", false
	}
	prefix := strings.Trim(strings.TrimSpace(opt.Prefix), "/")
	if prefix != "" {
		if !strings.HasPrefix(path, prefix+"/") {
			return "", false
		}
		path = strings.TrimPrefix(path, prefix+"/")
	}
	suffix := strings.TrimSpace(opt.Suffix)
	if suffix != "" {
		if !strings.HasSuffix(path, suffix) {
			return "", false
		}
		path = strings.TrimSuffix(path, suffix)
	}
	path = strings.Trim(path, "/")
	if path == "" {
		return "", false
	}
	return path, true
}
