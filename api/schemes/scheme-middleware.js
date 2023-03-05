const db = require("../../data/db-config");
const scModel = require("../schemes/scheme-model");


/*
  Eğer `scheme_id` veritabanında yoksa:

  durum 404
  {
    "message": "scheme_id <gerçek id> id li şema bulunamadı"
  }
*/
const checkSchemeId = async (req, res, next) => {
  try {
   
    const existRecort = await db("schemes").where("scheme_id",req.params.scheme_id).first();
    if(!existRecort){
      res.status(404).json({message:`scheme_id ${req.params.scheme_id} id li şema bulunamadı`})
    }else{
      req.scheme=existRecort;
    }
    next();
  } catch (error) {
    next(error);
  }
}

/*
  Eğer `scheme_name` yoksa, boş string ya da string değil:

  durum 400
  {
    "message": "Geçersiz scheme_name"
  }
*/
const validateScheme = (req, res, next) => {

}

/*
  Eğer `instructions` yoksa, boş string yada string değilse, ya da
  eğer `step_number` sayı değilse ya da birden küçükse:

  durum 400
  {
    "message": "Hatalı step"
  }
*/
const validateStep = (req, res, next) => {

}

module.exports = {
  checkSchemeId,
  validateScheme,
  validateStep,
}
