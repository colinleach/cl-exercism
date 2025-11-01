import Base: +, *, ^, -, /, <, <=, promote_rule

struct RationalNumber{T<:Integer} <: Real
    numer::T
    denom::T

    function RationalNumber{T}(n, d) where T<:Integer 
        (n ≠ 0 || d ≠ 0) || throw(ArgumentError("0/0 is invalid"))
        hcf = gcd(n, d)
        num, den = hcf > 0 ? (n ÷ hcf, d ÷ hcf) : (n, d)
        d ≥ 0 ? new(num, den) : new(-num, -den)
    end
end

RationalNumber(num::T, den::T) where {T<:Integer} = RationalNumber{T}(num, den)

RationalNumber{T}(r1::Integer) where {T<:Integer} = RationalNumber{T}(convert(T, r1), convert(T, 1))

promote_rule(::Type{RationalNumber{T}}, ::Type{S}) where {T<:Integer,S<:Integer} = 
    RationalNumber{promote_type(T,S)}

numerator(r::RationalNumber) = r.numer
denominator(r::RationalNumber) = r.denom

abs(rn::RationalNumber) = RationalNumber(Base.abs(rn.numer), Base.abs(rn.denom))

+(r1::RationalNumber, r2::RationalNumber) = 
    RationalNumber(r1.numer * r2.denom + r2.numer * r1.denom, r1.denom * r2.denom)

-(r1::RationalNumber, r2::RationalNumber) = 
    RationalNumber(r1.numer * r2.denom - r2.numer * r1.denom, r1.denom * r2.denom)

*(r1::RationalNumber, r2::RationalNumber) = RationalNumber(r1.numer * r2.numer, r1.denom * r2.denom)

/(r1::RationalNumber, r2::RationalNumber) = RationalNumber(r1.numer * r2.denom, r1.denom * r2.numer)

^(base::Real, r1::RationalNumber) = (float(base)^r1.numer)^(1 / r1.denom)

<(r1::RationalNumber, r2::RationalNumber) = 
    r1.denom == r2.denom ? r1.numer < r2.numer : r1.numer * r2.denom < r2.numer * r1.denom

<=(r1::RationalNumber, r2::RationalNumber) = 
    r1.denom == r2.denom ? r1.numer <= r2.numer : r1.numer * r2.denom <= r2.numer * r1.denom
