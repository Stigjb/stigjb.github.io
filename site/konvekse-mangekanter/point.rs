pub struct Vector(f64, f64);

impl Vector {
    fn new(x: f64, y: f64) -> Self {
        Self(x, y)
    }

    fn vector_to(&self, other: &Self) -> Self {
        Self(other.0 - self.0, other.1 - self.1)
    }

    /// Returns true if the vector points to the right hand side of the line passing through the
    /// points a and b
    fn right_of(&self, a: &Self, b: &Self) -> bool {
        let d = a.vector_to(b);
        let t = a.vector_to(self);

        (d.0 * t.1 - d.1 * t.0) < 0.
    }
}
