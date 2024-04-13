import Base: +, -,  *,  /,  ^,  ≈, ==

struct ComplexNumber <: Number
    real::Number
    imag::Number
end

real(z) = z.real
imag(z) = z.imag
conj(z) = ComplexNumber(z.real, -z.imag)
abs(z) = sqrt(z.real^2 + z.imag^2)

+(z1::ComplexNumber, z2::ComplexNumber) = 
    ComplexNumber(z1.real + z2.real, z1.imag + z2.imag)

-(z1::ComplexNumber, z2::ComplexNumber) = 
    ComplexNumber(z1.real - z2.real, z1.imag - z2.imag)

*(z1::ComplexNumber, z2::ComplexNumber) = 
    ComplexNumber(z1.real * z2.real - z1.imag * z2.imag,
                  z1.real * z2.imag + z1.imag * z2.real)
    
function /(z1::ComplexNumber, z2::ComplexNumber)
    denom = z2.real^2 + z2.imag^2
    ComplexNumber((z1.real * z2.real + z1.imag * z2.imag) / denom,
                  (z1.imag * z2.real - z1.real * z2.imag) / denom)
end
                      
^(z::ComplexNumber, n::Int) = 
    n == 2 ? ComplexNumber(z * conj(z), 0) : NULL

≈(z1::ComplexNumber, z2::ComplexNumber) = 
    z1.real ≈ z2.real && z1.imag ≈ z2.imag

==(z1::ComplexNumber, z2::ComplexNumber) = 
    z1.real == z2.real && z1.imag == z2.imag
