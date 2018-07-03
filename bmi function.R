BMI<-function(weight,height) {(weight)/((height)^2)}
#In kilograms and in cm
diagnostic_f<-function(weight,height){
  BMI_value<-(weight)/((height)^2)
    ifelse(BMI_value<18.5,"underweight",
         ifelse(BMI_value<25,"normal weight",
                ifelse(BMI_value<30,"overweight",
                   ifelse(BMI_value<35,"obesity"))))
}

