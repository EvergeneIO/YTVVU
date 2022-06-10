// create a config validator
const config = {
  type: "object",
  properties: {
    name: {
      type: "string",
      minLength: 5,
      maxLength: 10,
    },
    age: {
      type: "number",
      minimum: 18,
      maximum: 50,
    },
    address: {
      type: "object",
      properties: {
        street: {
          type: "string",
          minLength: 5,
          maxLength: 10,
        },
        city: {
          type: "string",
          minLength: 5,
          maxLength: 10,
        },
        state: {
          type: "string",
          minLength: 2,
          maxLength: 2,
        },
      },
    },
    hobbies: {
      type: "array",
      minItems: 3,
      maxItems: 5,
      items: {
        type: "string",
        minLength: 5,
        maxLength: 10,
      },
    },
  },
};

// create a validator instance
const validator = new Validator();

// validate the config
var result = validator.validate(config, config);

// print the result
console.log(result);

// print the errors
console.log(validator.getErrors());

// print the warnings
console.log(validator.getWarnings());
