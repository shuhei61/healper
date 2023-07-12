const calculateCalories = () => {
  const form = document.getElementById('new_user');
  form.addEventListener("submit", (e) => {    
    var gender = parseInt(document.getElementById('gender').value);
    const age = document.getElementById('age').value;
    const height = document.getElementById('height').value;
    const weight = document.getElementById('weight').value;
    var level = parseInt(document.getElementById('level').value);

    switch (gender) {
      case 2:
        gender = 'male';
        break;
      case 3:
        gender = 'female';
        break;
      default:
        gender = 0;
        break;
    }
    
    switch (level) {
      case 2:
        level = 1.2;
        break;
      case 3:
        level = 1.375;
        break;
      case 4:
        level = 1.55;
        break;
      case 5:
        level = 1.725;
        break;
      case 6:
        level = 1.9;
        break;
      default:
        level = 0;
        break;
    }

    // 必要なカロリーを計算
    var bmr = calculateBMR(gender, age, height, weight);
    var calories = Math.round(bmr * level);
    const caloriesObj = `<input value=${calories} name='user[essential_cal]' type="hidden">`;
    var fat_body = calculateFat_body(gender, age, height, weight);
    const fat_bodyObj = `<input value=${fat_body} name='user[fat_body]' type="hidden">`;
    form.insertAdjacentHTML("beforeend", caloriesObj);
    form.insertAdjacentHTML("beforeend", fat_bodyObj);
    form.submit();
    e.preventDefault();
  });
  
};

function calculateBMR(gender, age, height, weight) {
  var bmr = 0;

  if (gender === 'male') {
    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  } else if (gender === 'female') {
    bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  };

  return bmr;
};

function calculateFat_body(gender, age, height, weight) {
  var fat_body = 0;

  if (gender === 'male') {
    fat_body = (1.20 * ( weight / (height/100 * height/100))) + (0.23 * age) - 16.2;
  } else if (gender === 'female') {
    fat_body = (1.20 * ( weight / (height/100 * height/100))) + (0.23 * age) - 5.4;
  };

  return fat_body;
};
  

window.addEventListener("turbo:load",calculateCalories);