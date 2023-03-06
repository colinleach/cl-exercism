package lasagna

func PreparationTime(layers []string, prepTimePerLayer int) int {
	if prepTimePerLayer == 0 {
		prepTimePerLayer = 2
	}
	return prepTimePerLayer * len(layers)
}

func Quantities(layers []string) (noodles int, sauce float64) {
	noodles = 0
	sauce = 0.0
	for _, layer := range layers {
		if layer == "noodles" {
			noodles += 50
		} else if layer == "sauce" {
			sauce += 0.2
		}
	}
	return
}

func AddSecretIngredient(friendsList, myList []string) {
	myList[len(myList)-1] = friendsList[len(friendsList)-1]
}

func ScaleRecipe(quantities []float64, numPortions int) []float64 {
	scaleFactor := float64(numPortions) / 2.0
	scaled := make([]float64, len(quantities))
	for i := 0; i < len(quantities); i++ {
		scaled[i] = quantities[i] * scaleFactor
	}
	return scaled
}
