package apis

func newContextKey(name string) *contextKey {
	return &contextKey{name}
}

type contextKey struct {
	name string
}
