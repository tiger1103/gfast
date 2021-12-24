package plugins

type ICommonQQMail interface {
	SendMail(mailTo []string, subject string, body string) error
}

var CommonQQMail ICommonQQMail
