pub fn raindrops(n: u32) -> String {
    let pling = if n % 3 == 0 {
        String::from("Pling")
    } else {
        String::from("")
    };
    let plang = if n % 5 == 0 {
        String::from("Plang")
    } else {
        String::from("")
    };
    let plong = if n % 7 == 0 {
        String::from("Plong")
    } else {
        String::from("")
    };

    let drops = pling + &plang + &plong;
    if drops.len() == 0 {
        n.to_string()
    } else {
        drops
    }
}
