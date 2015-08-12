# ---- 3 Ranking hospitals by outcome in a state ---- #
# Orientiert sich an der vorherigen Funktion, gibt allerdings ein Ranking der Krankenhäuser
# aus.

rankhospital <- function(state = "NY", outcome = "heart attack", num = "best", rank = 1) {
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
    
    ## Return hospital name in that state with the given rank
    state_outcome <- data[data$State == state,] 
    state_outcome[,var_outcome] <- as.numeric(state_outcome[,var_outcome])
    print(c(state, outcome, num, rank))
    if(num == "worst") {
        sorted_outcome <- state_outcome[order(-state_outcome[var_outcome],state_outcome[2],na.last=NA),]
    }
    else {
        sorted_outcome <- state_outcome[order(state_outcome[var_outcome],state_outcome[2],na.last=NA),]
    }
    # print(sorted_outcome[, c(2, var_outcome)])
    ## 30-day death rate
    if(rank > nrow(sorted_outcome)) {
        result <- NA
        return(result)
    }
    else {
        result <- sorted_outcome[rank,]
    ## rate
        return(result[[2]])
    }
}