// write a function to seed a random number generator
func SeedRandomNumberGenerator() {
	rand.Seed(time.Now().UnixNano())
}

// Is the Seed function deprecated in Go?
// No, the Seed function is not deprecated in Go. It is used to seed the random number generator with a value.

// Create and seed the generator.
// Typically a non-fixed seed should be used, such as time.Now().UnixNano().
// Using a fixed seed will produce the same output on every run.
r := rand.New(rand.NewSource(99))

// write a function to seed a random number generator
func SeedRandomNumberGenerator() {
	rand.Seed(time.Now().UnixNano())
}