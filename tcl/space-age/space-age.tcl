proc onEarth {secs} { return [expr {$secs / 31557600.0}] }
proc onMercury {secs} { return [expr {[onEarth $secs] / 0.2408467}] }
proc onVenus {secs} { return [expr {[onEarth $secs] / 0.61519726}] }
proc onMars {secs} { return [expr {[onEarth $secs] / 1.8808158}] }
proc onJupiter {secs} { return [expr {[onEarth $secs] / 11.862615}] }
proc onSaturn {secs} { return [expr {[onEarth $secs] / 29.447498}] }
proc onUranus {secs} { return [expr {[onEarth $secs] / 84.016846}] }
proc onNeptune {secs} { return [expr {[onEarth $secs] / 164.79132}] }
proc onSun {secs} { error "not a planet" }
