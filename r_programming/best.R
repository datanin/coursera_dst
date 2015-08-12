# ---- 1 Plot the 30-day mortality rates for heart attack ---- #
# Daten einlesen. colClasses = "character" sorgt dafür dass wir die Datei als Strings einlesen
# outcome <- read.csv('hospdata/outcome-of-care-measures.csv', colClasses = "character")

# Da wir die Datei als Strings eingelesen haben, muss hier die Spalte umgewandelt werden
# outcome[,11] <- as.numeric(outcome[,11])
# Historgramm erzeugen: Zeile 11 enthält die Herzinfarkte
# hist(outcome[, 11])

# ---- 2 Finding the best hospital in a state ---- #
# Funktion werden zwei Variablen übergeben: state und outcome[heart attack, heart failure, pneumonia]
# Die Funktion liest die csv ein und gibt einen character vector mit dem Namen des
# Krankenhauses (Hospital.Name) mit den niedrigsten Werten (30 Tage) zurück. Hat ein Krankenhaus
# keine Daten zu dem gewünschten Fall, wird es ausgeschlossen.

best <- function(state, outcome) {
    ## Read outcome data
    data <- read.csv("hospdata/outcome-of-care-measures.csv", colClasses = "character", header = TRUE, sep = ",")
    
    ## Check that state and outcome are valid
    valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
    valid_states <- c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY")
    
    if (!is.element(state, valid_states)) stop("invalid state")
    if (!is.element(outcome, valid_outcomes)) stop("invalid outcome")
    
    # Spalte 2: Hospital Name, Spalte 7: State
    # Spalte 11: Heart Attack 30 Days, Spalte 17: Heart Failure 30 Days
    # Spalte 23: Pneumonia 30 Days
    if(outcome == "heart attack") var_outcome = 11
    else if(outcome == "heart failure") var_outcome = 17
    else if(outcome == "pneumonia") var_outcome = 23
    
    ## Return hospital name in that state with lowest 30-day death
    state_outcome <- data[data$State == state,] 
    state_outcome[,var_outcome] <- as.numeric(state_outcome[,var_outcome])
    sorted_outcome <- state_outcome[order(state_outcome[var_outcome],state_outcome[2]),]
    # print(sorted_outcome[c(2,11,17)])
    result <- head(sorted_outcome, n=1)
    ## rate
    return(result[[2]])
}