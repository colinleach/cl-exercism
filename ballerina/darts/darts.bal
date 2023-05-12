public function score(float x, float y) returns int {
    float radius_sq = x * x + y * y;
    if radius_sq <= 1.0 { return 10; }
    if radius_sq <= 25.0 { return 5; }
    if radius_sq <= 100.0 { return 1; }
    return 0;
}
